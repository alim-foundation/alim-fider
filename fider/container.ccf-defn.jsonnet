local common = import "common.ccf-conf.jsonnet";
local context = import "context.ccf-facts.json";
local fider = import "fider.ccf-conf.jsonet";
local containerSecrets = import "postgres.secrets.ccf-conf.jsonnet";
{
      "Dockerfile" : |||
          FROM getfider/fider:stable
          COPY fider-custom-templates/* /app/views/templates/
        |||,

        "docker-compose.yml" : std.manifestYamlDoc({
                version: '3.4',

                services: {
                        db: {
                                container_name: 'db',
                                image: 'postgres:9.6',
                                restart: 'always',
                                ports: ['5432:5432'],
                                networks: ['network'],
                                volumes: ['storage:/var/lib/postgresql/data'],
                                environment: [
                                        'POSTGRES_USER=' + containerSecrets.databaseUser,
                                        'POSTGRES_PASSWORD=' + containerSecrets.databasePassword,
                                        'POSTGRES_DB=' + containerSecrets.database
                                ]
                        },
                    app: {
                       build: {
                         	context: '.',
                         	dockerfile: 'Dockerfile',
                       },
		       container_name: context.containerName,
                       restart: 'always',
		       image: 'fider:latest',
                       ports: ['9000:3000'],
                       networks: ['network'],
                       environment: [
                               'GO_ENV=production',
                               'DATABASE_URL=postgres://'+containerSecrets.databaseUser+':'+containerSecrets.databasePassword+'@db:5432/'+containerSecrets.database+'?sslmode=disable',
                                   'JWT_SECRET='+fider.JWT_SECRET,
                                   'EMAIL_NOREPLY='+fider.EMAIL_NOREPLY,
                                   'EMAIL_SMTP_HOST='+fider.EMAIL_SMTP_HOST,
                                   'EMAIL_SMTP_PORT='+fider.EMAIL_SMTP_PORT,
                                   'EMAIL_SMTP_USERNAME='+fider.EMAIL_SMTP_USERNAME,
                                   'EMAIL_SMTP_PASSWORD='+fider.EMAIL_SMTP_PASSWORD,
                                        ],
		       labels: {
					'traefik.enable': 'true',
					'traefik.docker.network': common.defaultDockerNetworkName,
					'traefik.domain': 'feedback.alim.org',
					'traefik.backend': context.containerName,
					'traefik.frontend.entryPoints': 'http',
					'traefik.frontend.rule': 'Host: feedback.alim.org',
				       },
                           depends_on: ['db']

                }
                },

                networks: {
                        network: {
                                external: {
                                        name: common.defaultDockerNetworkName
                                },
                        },
                },

                volumes: {
                        storage: {
                                name: context.containerName
                        },
                },
        },
)
}


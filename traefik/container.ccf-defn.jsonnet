local manifestToml = import "manifestToml.libsonnet";
local common = import "common.ccf-conf.jsonnet";
local context = import "context.ccf-facts.json";

local traefikLogsDirInContainer = "/var/log/traefik";

{
	"docker-compose.yml" : std.manifestYamlDoc({
		version: '3.4',

		services: {
			container: {
				container_name: context.containerName,
				image: 'traefik:latest',
				restart: 'always',
				ports: ['80:80'],
				networks: ['network'],
				volumes: [
					'/var/run/docker.sock:/var/run/docker.sock',
					context.containerDefnHome + '/traefik.toml:/traefik.toml',
					'logs:' + traefikLogsDirInContainer,
				],
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
			logs: { 
				name: context.containerName + "_logs"
			},
		},
	}),

 	"traefik.toml" : manifestToml({
		debug: false,
		logLevel: "INFO",
		defaultEntryPoints: [
			"http"
		],
		entryPoints: {
			http: {
				address: ":80",
			},
		},
		docker: {
			endpoint: "unix:///var/run/docker.sock",
			domain: "appliance.local",
			watch: true,
			exposedByDefault: false
		},
		traefikLog: {
			filePath: traefikLogsDirInContainer + "/service.log"
		},
		accessLog: {
			filePath: traefikLogsDirInContainer + "/access.log"
		},
	}),
}

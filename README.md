# PTI Keycloak

Keycloak is used as SSO system for the PTI Health Ecosystem.

This repository contains the modifications on Keycloak.

The approach of this repository is to overwrite specific files and mount them into the docker image to overwrite the defaut files and folders.

## Getting Started

1. **Install dependencies.** This project requires the following tools to be installed and running:

   `docker, node.js`

2. **First start.** To start this server for the first time, execute the following three commands:

   ```
   cd themes/pti-health/login/resources
   npm i
   npm run build:tailwind
   cd ../../../..
   ```

   And here as handy one-liner:

   ```
   cd themes/pti-health/login/resources && npm i && npm run build:tailwind && cd ../../../..
   ```

   > This will install the theme dependencies and build a css bundle

3. **Start Server.** To start Keycloak, run:

   ```
   docker-compose up
   ```

   The server will be available at [localhost:8000/auth/admin](http://localhost:8080/auth/admin). You can login as admin with credentials:

   ```
   user: admin
   password: password
   ```

## Server Configuration

The server comes with the following default configuration:

      "realm": "PTI-Health",
      "auth-server-url": "http://localhost:8080/auth/",
      "ssl-required": "external",

And two clients. One for Patients:

     "resource": "boldo-patient",
     "public-client": true,
     "Valid Redirect URIs": "http://localhost:3000/*",
     "Browser Flow Override": "PTI Browser Patient"

And one for Doctors:

      "resource": "boldo-doctor",
      "public-client": true,
      "Valid Redirect URIs": "http://localhost:3000/*",
      "Browser Flow Override": "PTI Browser Doctor"

### Emails

Some actions require to send emails, so we setup a local mailserver sandbox that is very convenient. You can simply go to [localhost:8025](http://localhost:8025/). This will open an email client that receives all outgoing emails.

### Keycloak Endpoints

Keycloak is running on [localhost:8080](http://localhost:8080). All Keycloak paths are traditionally prefixed with `/auth`

To open the user login for the `PTI-Health` realm, navigate to: [localhost:8080/auth/realms/PTI-Health/account](http://localhost:8080/auth/realms/PTI-Health/account)

To open the user login for a certain client (in this case `cmr`), you need to provide `client_id` and `response_type` as query parameters:

[localhost:8080/auth/realms/PTI-Health/protocol/openid-connect/auth?client_id=boldo-patient&response_type=code](http://localhost:8080/auth/realms/PTI-Health/protocol/openid-connect/auth?client_id=boldo-patient&response_type=code)

To create a direct link to the registration, you can construct a link as follows:

```
http://<domain.com>/auth/realms/<realm-name>/protocol/openid-connect/registrations
?client_id=<client_id>
&response_type=code
&scope=openid email
&redirect_uri=http://<domain.com>/<redirect-path>
&kc_locale=<two-digit-lang-code>
```

Here a link ready to copy: [localhost:8080/auth/realms/PTI-Health/protocol/openid-connect/registrations?client_id=cmr&response_type=code](http://localhost:8080/auth/realms/PTI-Health/protocol/openid-connect/registrations?client_id=boldo-patient&response_type=code)

You can find more information about all the available endpoints for openID in the [official docs](https://www.keycloak.org/docs/latest/server_admin/#keycloak-server-oidc-uri-endpoints) and a good step-by-step tutorial about the Authorization Code Flow is available [here](https://www.appsdeveloperblog.com/keycloak-authorization-code-grant-example/).

## Develop

### Theme

The project contains a customized theme that is using tailwindcss.

The theme is located at `themes/pti-health/login` and a node project is located within the themse `resources` folder:

```
cd themes/pti-health/login/resources
```

You can run build and watch tasks like this:

```
// watch for changes in the tailwind.css file:
npm run watch:tailwind

// or to build:
npm run build:tailwind
```

On setup, the project creates an optimized tailwind version, only containing the classes that are used in the theme. You can run the following command to create such an optimized version:

```
NODE_ENV=production npm run build:tailwind
```

## Known Issues

Windows requires you to change the `docker-compose.yaml` file. This is because there is no `pwd` in windows but linking a single file into a docker container requires to set it as absolute path. Fixes are welcome!

## Authors and Contributions

This project was created as part of the iHub COVID-19 project in collaboration between [Penguin Academy](https://penguin.academy) and [PTI (Parque Tecnológico Itaipu Paraguay)](http://pti.org.py).

The project is currently under heavy development but contributors are welcome. For bugs or feature requests or eventual contributions, just open an issue.

## License

[Apache License 2.0](LICENSE)

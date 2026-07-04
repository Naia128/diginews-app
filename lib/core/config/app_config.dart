const appMode = String.fromEnvironment(
  'APP_MODE',
  defaultValue: 'DEV',
);

const isProd = appMode == 'PROD';

const appTitle = isProd
    ? 'UTD - 20123061'
    : 'DEV - Naia';
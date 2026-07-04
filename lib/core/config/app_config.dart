const appMode = String.fromEnvironment(
  'APP_MODE',
  defaultValue: 'DEV',
);

const isProd = appMode == 'PROD';
module.exports = {
  testEnvironment: 'jest-environment-jsdom',
  setupFilesAfterEnv: ['<rootDir>/jest.setup.js'],
  moduleNameMapper: {
    // 1. Forzar una única instancia en memoria
    '^react$': require.resolve('react'),
    '^react-dom$': require.resolve('react-dom'),
    '^react/jsx-runtime$': require.resolve('react/jsx-runtime'),
    
    // 2. Mapeo de estilos CSS
    '\\.(css|less|scss|sass)$': 'identity-obj-proxy'
  }
};
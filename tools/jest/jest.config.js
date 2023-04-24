module.exports = {
  preset: 'ts-jest',
  testEnvironment: 'node',
  silent: false,
  verbose: false,
  collectCoverage: true,
  moduleFileExtensions: ['js', 'jsx', 'json', 'ts', 'tsx', 'vue'],
  collectCoverageFrom: ['src/**/*.{ts,tsx,vue}', '!src/**/*.d.ts', '!src/**/*.test.{ts,tsx}'],
  snapshotResolver: "<rootDir>/../../tools/jest/snapshotResolver.js",
  // Playing around with this stuff
  // transform: {
  //   '^.+\\.(ts|tsx)?$': 'ts-jest',
  //   "^.+\\.(js|jsx)$": "babel-jest",
  // },
  // testMatch: ['**/*.test.ts(x)?'],
}

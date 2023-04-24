// Jest Snapshot Resolver for Bazel
// Bazel runs all of its build in a sandbox on a user's machine. This poses a problem
// for Jest snapshot tests when it comes time for a user to update them. Without firm
// path resolution, the snapshot would get updated ephemerally in the sandbox but not
// persisted in a user's project workspace.
// This file creates a stable mapping from the tests run by Jest in the sandbox to
// the snapshots in the user's workspace. This allows Jest to properly update the
// snapshots if needed.
// Note: this will only update the snapshots locally if the `bazel run` command is
//       used, because that's when the BUILD_WORKSPACE_DIRECTORY environment variable
//       is populated at runtime
const {
  basename,
  dirname,
  join
} = require('path')
const bazelDir = process.env['BUILD_WORKSPACE_DIRECTORY'] || process.cwd()
const bazelTarget = process.env['BAZEL_TARGET'] || ''
const pathEnd = bazelTarget.slice(2, bazelTarget.indexOf(':'))

const pathStart = (path) =>
  join(bazelDir, pathEnd, dirname(path).slice(path.lastIndexOf(pathEnd) + pathEnd.length))

module.exports = {
  resolveSnapshotPath: (testPath, snapshotExtension) => {
    const split = testPath.split('__main__')
    const subPath = split[split.length - 1] || testPath
    const fileNameSplit = subPath.split('/')
    const fileName = fileNameSplit[fileNameSplit.length - 1]
    return join(bazelDir, subPath)
      .replace(fileName, `__snapshots__/${fileName}`)
      .replace('.js', `.ts${snapshotExtension}`)
  },

  resolveTestPath: (snapshotFilePath, snapshotExtension) => join(pathStart(dirname(snapshotFilePath)), basename(snapshotFilePath)),

  testPathForConsistencyCheck: join(bazelDir, pathEnd, 'a.test.ts'),
}

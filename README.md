# Bazel Issue

This project actually represents several strange bazel issues. For convenience, all these issues 
can be seen/tested via the single `example` package provided. These issues appear to be related to the 
aspect rules and how they are integrated with Jest, and Bazel

1. `bazel test //packages/example` does not run tests as expected 
    ```bash 
    bazel test //packages/example                               
    INFO: Analyzed target //packages/example:example (0 packages loaded, 0 targets configured).
    INFO: Found 1 target and 0 test targets...
    Target //packages/example:example up-to-date:
      bazel-bin/packages/example/index.js
      bazel-bin/packages/example/thing.js
      bazel-bin/packages/example/index.js.map
      bazel-bin/packages/example/thing.js.map
    INFO: Elapsed time: 0.207s, Critical Path: 0.00s
    INFO: 1 process: 1 internal.
    INFO: Build completed successfully, 1 total action
    ERROR: No test targets were found, yet testing was requested
     
    ```
2. `bazel run //packages/example:example_test` results in errors
   1.  error TS7016: Could not find a declaration file for module './thing'. '/private/var/tmp/_bazel_trammelmay/73d815cbd844b5db9121bdc11d04b3d8/execroot/__main__/bazel-out/darwin_arm64-fastbuild/bin/packages/example/example_test.sh.runfiles/__main__/packages/example/thing.js' implicitly has an 'any' type.
   2.  a strange snapshot error 
    ```bash
    FAIL  packages/example/thing.test.js
● thing › doThing › should return thing string

    expect(received).toMatchSnapshot()

    Snapshot name: `thing doThing should return thing string 1`

    - Snapshot  - 0
    + Received  + 0

      {
        "stuff": "thing string",
      }

       6 |       const thing = new Thing()
       7 |       const result = thing.doThing()
    >  8 |       expect(result).toMatchSnapshot()
         |                      ^
       9 |     })
      10 |   })
      11 | })

      at Object.<anonymous> (thing.test.ts:8:22)
    ```
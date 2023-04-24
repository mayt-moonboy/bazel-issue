import { Thing } from './thing'

describe('thing', () => {
  describe('doThing', () => {
    test('should return thing string', () => {
      const thing = new Thing()
      const result = thing.doThing()
      expect(result).toMatchSnapshot()
    })
  })
})
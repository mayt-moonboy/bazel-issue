
export interface ThingData {
  stuff: string
}

export class Thing {
    public doThing(): ThingData {
      return {
        stuff: 'thing string'
      }
    }
}

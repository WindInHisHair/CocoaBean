describe "Dispatch Async", ->
  a = 25
  time = new Date().getTime()
  beforeEach (done) ->
    CB.DispatchAsync(-> a = 26; done())

  it "should perform function right away", ->
    later = new Date().getTime()
    expect(a).toBe(26)
    expect(later - time).not.toBeGreaterThan(200)

describe "Dispatch After", ->
  a = 20
  time = new Date().getTime()
  beforeEach (done) ->
    CB.DispatchAfter (-> a = 30; done()), 2000

  it "should perform after some time", ->
    later = new Date().getTime()
    expect(a).toBe(30)
    expect(later - time).toBeGreaterThan(2000)
    expect(later - time).not.toBeGreaterThan(2200)

describe "Dispatch Once", ->
  it "shouldn't perform something twice", ->
    onceToken = "I'm a nice onceToken"
    a = 2
    CB.DispatchOnce onceToken, ->
      a++
    CB.DispatchOnce onceToken, ->
      a++
    expect(a).toBe(3)

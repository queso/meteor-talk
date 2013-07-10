Meteor.Router.add
  '/': ->
    Session.set('currentSlideId', 0)
    "slide0"
  '/slides/:id': (id) ->
    "slide#{id}"

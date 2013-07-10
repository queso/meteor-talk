Meteor.Router.add
  '/': ->
    Session.set('currentSlideId', 1)
    "slide-1"
  '/slides/:id': (id) ->
    "slide-#{id}"

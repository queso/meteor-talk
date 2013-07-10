Meteor.startup ->
  Deps.autorun ->
    slide = Slides.findOne()
    if slide
      if slide.slideId != Session.get('currentSlideId')
        Session.set('currentSlideId', slide.slideId)
        Meteor.Router.to("/slides/#{slide.slideId}")

Template.nav.events
  'click .show-presenter': ->
    Session.set('presenter', true)

  'click .hide-presenter': ->
    Session.set('presenter', false)

Template.nav.helpers
  showPresenterInterface: ->
    Session.get('presenter') == true

Template.content.helpers
  nextPage: ->
    slide = parseInt(Session.get('currentSlideId'))
    slide + 1

  prevPage: ->
    slide = parseInt(Session.get('currentSlideId'))
    slide - 1

  showPresenterInterface: ->
    Session.get('presenter') == true

Template.content.events
  'click .next-slide': ->
    slide = parseInt(Session.get('currentSlideId'))
    newSlide = slide + 1
    Session.set('currentSlideId', newSlide)
    slide = Slides.findOne()
    if slide
      Slides.update(slide._id, {slideId: newSlide})

  'click .prev-slide': ->
    slide = parseInt(Session.get('currentSlideId'))
    newSlide = slide - 1
    Session.set('currentSlideId', newSlide)
    slide = Slides.findOne()
    if slide
      Slides.update(slide._id, {slideId: newSlide})

  'click .reset-slides': (e)->
    e.preventDefault()
    slide = Slides.findOne()
    if slide
      Slides.update(slide._id, {slideId: 1})

root = exports ? this
root.Slides = new Meteor.Collection('slides')
root.Suggestions = new Meteor.Collection('suggestions')

if Meteor.isServer and Slides.find().count() is 0
  Slides.insert({slideId: 1})

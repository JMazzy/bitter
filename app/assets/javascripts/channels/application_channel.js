//= require cable

this.App || (this.App = {})
App.cable = Cable.createConsumer('ws://localhost:28080')

//= require cable

this.App || (this.App = {})
App.cable = ActionCable.createConsumer('ws://localhost:28080')

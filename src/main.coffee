require './main.styl'

Vue = require 'vue'


# Component registration
Vue.component 'spacing', require './components/spacing.vue'
Vue.component 'item', require './components/item.vue'

new Vue
	el: '#main'

	data: -> firedUp: false

	ready: ->
		setTimeout =>
			@firedUp = true
		, 200

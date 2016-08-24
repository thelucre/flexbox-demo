<!--
Vue component template file
-->

<template lang='jade'>
.flex-root
	.example-1(transition='fade-up' v-if='$root.firedUp')
		.info
			h1 Let's start with a classic
			p A simple box with a header, vertically centered copy, and some footer icons.

		.items
			item(
				title="Wonderful News!"
				copy="Integer posuere erat a ante venenatis dapibus posuere velit aliquet. Cras mattis consectetur purus sit amet fermentum. Vestibulum id ligula porta felis euismod semper."
			)
			item(
				title="What lovely weather"
				copy="Vestibulum id ligula porta felis euismod semper."
			)
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
# module.exports =
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus'>
@import '../definitions.styl'

.flex-root
	.items
		padding 50px
		width 100%
		display flex
		flex-wrap wrap
		justify-content center
</style>

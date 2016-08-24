<!--
Vue component template file
-->

<template lang='jade'>
.item
	.content
		.section.header
			h3 {{ title }}
		.section.copy
			p {{ copy }}
		.section.footer
			.icon &#9730;
			.icon &#9729;
			.icon &#9728;
</template>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<script lang='coffee'>
module.exports =
	props: ['title','copy']

	ready: ->
		console.log @props
</script>

<!-- ––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– -->

<style lang='stylus'>
@import '../definitions.styl'

.item
	background blue
	margin 20px
	padding 10px
	border-radius 10px
	width 400px
	text-align center
	align-items stretch
	display flex

	.content
		background teal
		border-radius 5px
		padding 20px
		display flex
		flex-grow 100 // like width 100%
		flex-direction column
		justify-content space-between
		align-items center

	.header
		font-size 26px
		line-height 1

	.copy
		align-self center
		margin 20px

	.footer
		display flex
		align-self flex-end

		.icon
			font-size 30px
			margin 0 5px
			color mint

</style>

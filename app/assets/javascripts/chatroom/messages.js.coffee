# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.Messages = 
	# maximun or minimun your chatroom
	minChatroom: () ->
		$("#chatroom").slideToggle()
		$("#chatBeam").show()
		false

	maxChatroom: () ->
		$("#chatBeam").hide()
		flash = $("#chatBeam .max-chatroom").attr("interval")
		$("#chatBeam .max-chatroom").attr("interval", null)
		clearInterval(flash)
		$("#chatroom").slideToggle()
		false

	# Editor: change the text in textarea
	changeSelectionChar: (elemTag) ->
		editor = $("#new_message_editor")
		selectionStart = editor[0].selectionStart
		selectionEnd = editor[0].selectionEnd

		if selectionStart != selectionEnd
			editorCharArray = editor.val().split("")
			editorCharArray.splice(selectionEnd, 0, elemTag[1])
			editorCharArray.splice(selectionStart, 0, elemTag[0])
			editorText = convertTagToMark(editorCharArray.join(''))
			editor.val(editorText)
		false

	changeFontBlod: () ->
		Messages.changeSelectionChar(["<b>", "</b>"])
		false

	changeFontItalic: () ->
		Messages.changeSelectionChar(["<i>", "</i>"])
		false

	changeFontColor: () ->
		Messages.changeSelectionChar(["<span style=\"color: red\">", "</span>"])
		false

	# Editor: show all the emotions for selecting
	constructEmotions: () ->
		table = $("table.chatroom-emotions-images tbody")
		page = $("<div><span class='emotions-page' style='float: left;'><</span><span class='emotions-page' style='float:right;'>></span></div>")
		if !table.has("span").length
			for i in [0...10]
				if i < 5
					row = $("<tr></tr>")
				else
					row = $("<tr style='display:none;'></tr>")
				for j in [0...8]
					n = i * 8 + j
					img = $("<span></span>").addClass("emotion-img")
					img.attr("emotion", "#{n}")
					img.css({"background": "url(\"/assets/emotions/#{n}.gif\")"})
					img.click(Messages.selectEmotion)
					cell = $("<td></td>").addClass("chat-cell").append(img)
					row.append(cell)
				table.append(row)
			table.append(page)
		$("span.emotions-page").off("click")
		Messages.emotionsPageTurning()
		false

	emotionsPageTurning: () ->
		$("span.emotions-page").click ->
			if $(this).html() == "&lt;"
				$("table.chatroom-emotions-images tbody tr").toggle()
			else if $(this).html() == "&gt;"
				$("table.chatroom-emotions-images tbody tr").toggle()
			false
		false
	
	displayAllEmotions: () -> 
		Messages.constructEmotions()
		$("table.chatroom-emotions-images").toggle()
		false

	# Editor: select one emotion to textarea
	selectEmotion: () ->
		img = $(this).attr("emotion")
		imageTag = "<img src=\"/assets/emotions/#{img}.gif\" />"
		editor = $("#new_message_editor")
		selectionStart = editor[0].selectionStart
		editorCharArray = editor.val().split("")
		editorCharArray.splice(selectionStart, 0, imageTag)
		editorText = convertTagToMark(editorCharArray.join(''))
		editor.val(editorText)
		$("table.chatroom-emotions-images").toggle()
		false

	# Editor: show Every color in table
	constructColors: () ->
		colors = [
			"#FFFFFF", "#000000", "#EEEEC1", "#1F497D", "#4F81BD", "#C0504D", "#9BBB59", "#8064A2", "#4BACC6", "#F79646",
			"#F2F2F2", "#7F7F7F", "#DDD9C3", "#C6D9F0", "#DBE5F1", "#F2DCDB", "#EBF1DD", "#E5E0DC", "#DBEEF3", "#FDEADA",
			"#D8D8D8", "#595959", "#C4DB97", "#8DB3E2", "#B8CCE4", "#E5B9B7", "#D7E3BC", "#CCC1D9", "#B7DDE8", "#FBD5b5",
			"#BFBFBF", "#3F3F3F", "#938953", "#548DD4", "#95B3D7", "#D99694", "#C3D69B", "#B2A27C", "#92CDDC", "#FAC08F",
			"#A5A5A5", "#262626", "#494429", "#17365D", "#366092", "#953734", "#76923C", "#5F497A", "#31859B", "#E36709",
			"#7F7F7F", "#0C0C0C", "#1D1D10", "#0F243E", "#244061", "#632423", "#4F6128", "#3F3151", "#205867", "#974806",
			"#C00000", "#FF0000", "#FFC000", "#FFFF00", "#92D050", "#00B050", "#00B0F0", "#0070C0", "#002060", "#7030A0"
		]
	
	constructColorsTab: () ->
		colors = Messages.constructColors()
		table = $("table.chatroom-font-colors tbody")
		if !table.has("span").length
			for i in [0...7]
				row = $("<tr></tr>")
				for j in [0...10]
					n = i * 10 + j
					color = $('<span></span>').addClass("font-color")
					num = color.attr("color-num", "#{colors[n]}")
					color.css({"background-color": "#{num.attr('color-num')}"})
					color.click(Messages.selectColor)
					cell = $("<td></td>").addClass("chat-cell").append(color)
					row.append(cell)
				table.append(row)
		false
	
	displayAllColors: () ->
		Messages.constructColorsTab()
		$("table.chatroom-font-colors").toggle()
		false
		
	# Editor: select one color for text
	selectColor: () ->
		color = $(this).attr("color-num")
		fontTag = ["<span style=\"color: #{color}\">", "</span>"]
		editor = $("#new_message_editor")
		Messages.changeSelectionChar(fontTag)
		$("table.chatroom-font-colors").toggle()
		false
		

$(document).ready ->
	$(".min-chatroom").click ->
		Messages.minChatroom()
		false

	$(".max-chatroom").click ->
		Messages.maxChatroom()
		false

	$(".emotions").click ->
		Messages.displayAllEmotions()
		false

	$(".font-bloder").click ->
		Messages.changeFontBlod()
		false

	$(".font-italic").click ->
		Messages.changeFontItalic()
		false

	$(".font-colorer").click ->
		Messages.displayAllColors()
		false

/**
 * Author: TsaiKoga
 * Comment: These code are used to convert the image tags and other tags into marks.
 * Tags: Bold ([bold][-bold] => <b></b>)
 *       Itablic ([italic][-italic] => <i></i>)
 *       Emotions ([smile] => <img src="/assets/emotions/0.gif"/>)
 *       FontColor ([color:#FFFFFF][-color] => <span style="background-color: #ffffff"></span>)
 */

function convertTagToMark(str) {
		var emotions = [
			"smile", "despressed", "like", "dull", "proud", "cry", "shy", "shut up",
			"nap", "big cry", "awkward red", "angry", "naughty", "snag", "surprise", "bad",
			"cool", "awkward", "scream", "vomit", "giggle", "lovely", "who cares", "zhuai",
			"hungry", "sleepy", "scared", "sweat", "simper", "solider", "strive", "shout",
			"questionaire", "hiss", "dizzy", "impantient", "be bombed", "skull", "hit head", "bye"
		];
		var s = "";

		if (str.length == 0) return "";
		s = str.replace(/<b>/g, "[bold]");
		s = s.replace(/<\/b>/g, "[-bold]");
		s = s.replace(/<i>/g, "[italic]");
		s = s.replace(/<\/i>/g, "[-italic]");
		s = s.replace(/(<span style="color: )(#.{6})(">)/g, function(m, p1, p2, p3) {
				return "[color:"+ p2 +"]";
		});
		s = s.replace(/<\/span>/g, "[-color]");
		s = s.replace(/(<img src="\/assets\/emotions\/)(\d+)(\.gif" \/>)/g, function(m, p1, p2, p3) {
				return "[" + emotions[p2] + "]";
		});
		return s;
}


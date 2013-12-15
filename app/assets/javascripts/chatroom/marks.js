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
			"smile", "despressed", "like", "dull", "proud", "cry", "shy", "shut_up",
			"nap", "big_cry", "awkward_red", "angry", "naughty", "snag", "surprise", "bad",
			"cool", "awkward", "scream", "vomit", "giggle", "lovely", "who_cares", "zhuai",
			"hungry", "sleepy", "scared", "sweat", "simper", "solider", "strive", "shout",
			"questionaire", "hiss", "dizzy", "impantient", "be_bombed", "skull", "hit_head", "bye",
			"sweat", "pick_nose", "applause", "embarrassed", "cheeky_grin", "not_worth_left", "not_worth_right", "yawn", 
			"contempt", "grievance", "sad", "sinister_smile", "kiss", "startle", "pitiful", "chopper",
			"watermelon", "beer", "basketball", "pingpong", "coffee", "rice", "pig", "flower",
			"wither", "love", "heart", "borken_heart", "cake", "light", "bomb", "sword", 
			"football", "insect", "shit", "moon", "sun", "gift", "hug", "good", 
			"Lously", "agree", "Yeal", "greet", "come", "fist", "little_finger",
			"love_you", "no", "ok"
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


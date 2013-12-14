(reader extendClass: 'HtmlTag')
!
(reader addInstVar: 'element')
!
(reader addInstVar: 'stream')
!
(reader addInstVar: 'callbackRegistry')
!
(reader addInstVar: 'classes')
!
(reader addMethod: 'gravel')
!
codearea: aHolder autocompleteTokens: autocompleteTokens rows: rows cols: cols onAccept: aBlock
	| callbackID |
	callbackID := self addCallback: aHolder.
	self
		tag: #textarea
		attributes: ((Dictionary new)
				at: 'id' put: 'id_' , callbackID;
				at: 'name' put: callbackID;
				at: 'rows' put: rows;
				at: 'cols' put: cols;
				yourself)
		do: [self text: aHolder value].
	self
		script: '
var words = ['
				, (autocompleteTokens join: [:each | '"' , each , '"'] with: ', ')
					, '];
var WORD = /[\w$]+/, RANGE = 500;
	smalltalkHint = function(editor, options) {
    var word = options && options.word || WORD;
    var range = options && options.range || RANGE;
    var cur = editor.getCursor(), curLine = editor.getLine(cur.line);
    var start = cur.ch, end = start;
    while (end < curLine.length && word.test(curLine.charAt(end))) ++end;
    while (start && word.test(curLine.charAt(start - 1))) --start;
    var curWord = start != end && curLine.slice(start, end);

	var cur = editor.getCursor(), token = editor.getTokenAt(cur), tprop = token;
	list = [];
	for (var i = 0; i < words.length; i++) {
		var t = words[i];
		if (t.slice(0, curWord.length) == curWord) {
			list.push(t);
		}
	}
	return {list: list, from: CodeMirror.Pos(cur.line, start), to: CodeMirror.Pos(cur.line, end)};
  };
	CodeMirror.commands.autocomplete = function(cm) {
		CodeMirror.showHint(cm, smalltalkHint);
      };
	var editor = CodeMirror.fromTextArea(document.getElementById("id_'
					, callbackID
					, '"), {
        lineNumbers: true,
        matchBrackets: true,
        mode: "text/x-stsrc",
        indentUnit: 4,
        extraKeys: {"Ctrl-Space": "autocomplete",
				"Ctrl-S": function(instance) {  click('
					, (self addCallback: aBlock) printString , ');  },
}
      });'
!

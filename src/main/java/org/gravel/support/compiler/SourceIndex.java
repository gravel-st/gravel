package org.gravel.support.compiler;

import java.nio.CharBuffer;

import org.gravel.support.jvm.FilenameExtensions;
import org.gravel.support.jvm.ReadStreamExtensions;
import org.gravel.support.parser.SourceFile;
import org.gravel.support.parser.SourcePosition;

public class SourceIndex {

	private SourceFile sourceFile;
	private int[] positions;

	public SourceIndex(SourceFile sourceFile) {

		this.sourceFile = sourceFile;
		final String str = FilenameExtensions.contentsOfEntireFile(sourceFile
				.asFile());
		positions = new int[str.length() + 1];
		final CharBuffer stream = org.gravel.support.jvm.ReadStreamFactory
				.on_(str);
		int line = 1;
		int pos = 0;
		while (!ReadStreamExtensions.atEnd(stream)) {
			final Character ch = ReadStreamExtensions.next(stream);
			pos++;
			if (ch == '\n')
				line++;
			positions[pos] = line;
		}
	}

	public int lineNumberOf(SourcePosition sourcePosition) {
		int index = sourcePosition.start();
		if (positions.length <=index ) return 0;
		return positions[index];
	}

	public String name() {
		return sourceFile.name();
	}

}

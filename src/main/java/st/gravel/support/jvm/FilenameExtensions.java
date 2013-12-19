package st.gravel.support.jvm;

import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;

public class FilenameExtensions {

	public static String contentsOfEntireFile(File file) {
		byte[] encoded;
		try {
			encoded = Files.readAllBytes(file.toPath());
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		return StandardCharsets.UTF_8.decode(ByteBuffer.wrap(encoded))
				.toString();
	}

}

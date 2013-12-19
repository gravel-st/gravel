package st.gravel.support.compiler;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

public class StClassLoader extends ClassLoader {
	private static class ClassRecord {

		private final String name;

		public String getName() {
			return name;
		}

		public Class<?> getStClass() {
			return stClass;
		}

		public String getChecksum() {
			return checksum;
		}

		private final Class<?> stClass;
		private final String checksum;

		public ClassRecord(String name, Class<?> stClass, String checksum) {
			this.name = name;
			this.stClass = stClass;
			this.checksum = checksum;
		}

	}

	private final HashMap<String, StClassLoader.ClassRecord> stClasses = new HashMap<>();

	public Class<?> defineClass(final String name, final byte[] b) {
		final StClassLoader.ClassRecord current = stClasses.get(name);
		if (current == null) {
			final Class<?> newClass = defineClass(name, b, 0, b.length);
			String checksum = sha256Hash(b);
			stClasses.put(name, new ClassRecord(name, newClass, checksum));
			return newClass;
		} else {
			String checksum = sha256Hash(b);
			if (!current.getChecksum().equals(checksum)) {
				throw new ClassRedefinitionError();
			}
			return current.getStClass();
		}
	}

	public static String sha256Hash(final byte[] b) {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}
		md.update(b);
		byte[] mdbytes = md.digest();
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < mdbytes.length; i++) {
			hexString.append(Integer.toHexString(0xFF & mdbytes[i]));
		}
		String checksum = hexString.toString();
		return checksum;
	}
}
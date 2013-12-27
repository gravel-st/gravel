package st.gravel.support.jvm;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.node.ArrayNode;
import org.codehaus.jackson.node.ObjectNode;

import st.gravel.core.Symbol;

public class StringExtensions {

	public static char at_(String receiver, int i) {
		return receiver.charAt(i - 1);
	}

	public static String do_(String receiver, Object aBlock) {
		Block1 bl = (Block1) aBlock;
		for (int i = 0; i < receiver.length(); i++) {
			bl.value_(receiver.charAt(i));
		}
		return receiver;
	}

	public static int size(String receiver) {
		return receiver.length();
	}

	public static boolean sortsLowerThan_(String receiver, String other) {
		return receiver.compareTo(other) < 0;
	}

	public static String newInstance(Object receiver) {
		return new String();
	}

	public static String newInstance_(Object receiver, int size) {
		final StringBuffer stringBuffer = new StringBuffer(size);
		for (int i= 0; i < size ; i++) {
			stringBuffer.appendCodePoint(0);
		}
		return stringBuffer.toString();
	}

	public static String[] tokensBasedOn_(String receiver, char ch) {
		ArrayList<String> parts = new ArrayList<>();
		int length = receiver.length();
		int mark = 0;
		for (int i = 0; i < length; i++) {
			if (receiver.charAt(i) == ch) {
				parts.add(receiver.substring(mark, i));
				mark = i + 1;
			}
		}
		parts.add(receiver.substring(mark, length));
		return parts.toArray(new String[parts.size()]);
	}

	public static Map<String, Object> parseAsJSONValue(String src) {
		ObjectMapper mapper = new ObjectMapper();
		ObjectNode rootNode;
		try {
			rootNode = (ObjectNode) mapper.readValue(src, JsonNode.class);
		} catch (JsonParseException e) {
			throw new RuntimeException(e);
		} catch (JsonMappingException e) {
			throw new RuntimeException(e);
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
		HashMap<String, Object> map = new HashMap<String, Object>();
		for (Iterator<Entry<String, JsonNode>> iter = rootNode.getFields(); iter
				.hasNext();) {
			Entry<String, JsonNode> field = iter.next();
			JsonNode value = field.getValue();
			Object o = jsonNodeAsSimpleObject(value);
			map.put(field.getKey(), o);
		}

		return map;
	}

	private static Object jsonNodeAsSimpleObject(JsonNode value) {
		Object o = null;
		if (value.isTextual()) {
			o = value.asText();
		} else if (value.isArray()) {
			ArrayList<Object> arrayList = new ArrayList<>();
			for (Iterator<JsonNode> iter = ((ArrayNode) value).getElements(); iter
					.hasNext();) {
				arrayList.add(jsonNodeAsSimpleObject(iter.next()));
			}
			o = arrayList.toArray();
		} else if (value.isNull()) {
			o = null;
		} else if (value.isObject()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			final Iterator<Entry<String, JsonNode>> fields = value.getFields();
			while (fields.hasNext()) {
				final Entry<String, JsonNode> next = fields.next();
				map.put(next.getKey(), jsonNodeAsSimpleObject(next.getValue()));
			}
			o = map;
		} else
			throw new RuntimeException("Unknown type: " + value);
		return o;
	}

	public static String comma_(Object receiver, Object other) {
		String rec = (receiver instanceof Symbol) ? ((Symbol) receiver)
				.asString() : (String) receiver;

		if (other instanceof Symbol)
			return rec + ((Symbol) other).asString();
		return rec + other;
	}

	public static boolean equals_(String receiver, Object other) {
		return (receiver == null && other == null)
				|| (receiver != null && other != null && receiver.equals(other));
	}
	
	public static String copyFrom_to_(String receiver, int start, int stop) {
		return receiver.substring(start - 1, stop);
	}
	

	public static void writeToFile_(String receiver, File file) {
		throw new UnsupportedOperationException("Not Implemented Yet");
	}

	public static File asFilename(String pathname) {
		return new File(pathname);
	}

	public static Float parseFloat(String _valueString) {
		return Float.valueOf(_valueString);
	}

	public static Character lineEndConvention() {
		return '\n';
	}
}

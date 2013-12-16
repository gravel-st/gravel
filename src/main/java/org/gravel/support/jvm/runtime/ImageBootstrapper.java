package org.gravel.support.jvm.runtime;

import java.io.File;
import java.net.URL;
import java.util.List;

import org.gravel.support.parser.ClassProducer;
import org.gravel.support.parser.DiskClassReader;
import org.gravel.support.parser.PackageNode;
import org.gravel.support.parser.SelectorConverter;
import org.gravel.support.parser.SystemDefinitionNode;
import org.gravel.support.parser.SystemMapping;
import org.gravel.support.parser.SystemNode;
import org.gravel.support.parser.SystemNodeBuilder;

public class ImageBootstrapper {
	private static final SelectorConverter selectorConverter = SelectorConverter.factory
			.basicNew();

	public class Fromage {

	}

	public static final SystemMapping systemMapping = SystemMapping.factory
			.systemNode_compilerTools_(SystemNode.factory.empty(),
					new JavaSystemMappingCompilerTools());

	public static void bootstrap() {
		File fn = defaultSourceFolder();
		bootstrap(fn);
	}

	public static File defaultSourceFolder() {
		return new File(System.getProperty("user.dir")+ "/src/main/st");
	}

	public static void bootstrap(File fn) {
		systemMapping.updateTo_(loadSystemDefinitionNode(fn));
	}

	public static SystemDefinitionNode loadSystemDefinitionNode(File fn) {
		DiskClassReader diskClassReader = DiskClassReader.factory
				.root_producer_(fn, ClassProducer.factory.basicNew());
		return diskClassReader.read();
	}

}

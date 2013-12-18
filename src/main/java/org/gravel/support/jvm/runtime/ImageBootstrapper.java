package org.gravel.support.jvm.runtime;

import java.io.File;

import org.gravel.support.compiler.ast.ClassProducer;
import org.gravel.support.compiler.ast.DiskClassReader;
import org.gravel.support.compiler.ast.SelectorConverter;
import org.gravel.support.compiler.ast.SystemDefinitionNode;
import org.gravel.support.compiler.ast.SystemMapping;
import org.gravel.support.compiler.ast.SystemNode;

public class ImageBootstrapper {
	private static final SelectorConverter selectorConverter = SelectorConverter.factory
			.basicNew();


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
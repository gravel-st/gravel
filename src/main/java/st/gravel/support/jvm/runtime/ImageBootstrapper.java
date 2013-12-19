package st.gravel.support.jvm.runtime;

import java.io.File;

import st.gravel.support.compiler.ast.ClassProducer;
import st.gravel.support.compiler.ast.DiskClassReader;
import st.gravel.support.compiler.ast.SystemDefinitionNode;
import st.gravel.support.compiler.ast.SystemMapping;
import st.gravel.support.compiler.ast.SystemNode;

public class ImageBootstrapper {

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
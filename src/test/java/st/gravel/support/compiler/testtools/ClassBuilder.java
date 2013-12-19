package st.gravel.support.compiler.testtools;

import static org.junit.Assert.assertEquals;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ast.ClassNode;
import st.gravel.support.compiler.ast.EmptyTraitUsageNode;
import st.gravel.support.compiler.ast.MethodNode;
import st.gravel.support.compiler.ast.Parser;
import st.gravel.support.compiler.ast.SharedDeclarationNode;
import st.gravel.support.compiler.ast.SystemDefinitionNode;
import st.gravel.support.compiler.ast.VariableDeclarationNode;
import st.gravel.support.jvm.runtime.ImageBootstrapper;

public class ClassBuilder {

	private static int evaluateCounter = 0;
	private final String name;
	private String superclassName = "st.gravel.lang.Object";
	private final ArrayList<MethodNode> methods = new ArrayList<>();
	private final ArrayList<MethodNode> classMethods = new ArrayList<>();
	private final ArrayList<VariableDeclarationNode> instVars = new ArrayList<>();

	public ClassBuilder(String name) {
		this.name = name;
	}

	public ClassBuilder method(String source) {
		methods.add(Parser.factory.parseMethod_(source));
		return this;
	}

	public ClassBuilder superclassName(String superclassName) {
		this.superclassName = superclassName;
		return this;
	}

	public ClassBuilder classMethod(String source) {
		classMethods.add(Parser.factory.parseMethod_(source));
		return this;
	}

	public ClassBuilder instVar(String string) {
		instVars.add(VariableDeclarationNode.factory.name_(string));
		return this;
	}

	public Class build() {
		Map<String, String> _properties = new HashMap<>();
		VariableDeclarationNode[] _instVars = instVars
				.toArray(new VariableDeclarationNode[instVars.size()]);
		VariableDeclarationNode[] _classInstVars = new VariableDeclarationNode[0];
		MethodNode[] _methods = methods.toArray(new MethodNode[methods.size()]);
		MethodNode[] _classMethods = classMethods
				.toArray(new MethodNode[classMethods.size()]);
		Symbol[] _namespace = new Symbol[] { Symbol.value("ClassBuilder") };
		ClassNode classNode = ClassNode.factory
				.name_superclassPath_properties_instVars_classInstVars_sharedVariables_methods_classMethods_namespace_isExtension_isTrait_traitUsage_classTraitUsage_(
						Symbol.value(name), superclassName, _properties,
						_instVars, _classInstVars,
						new SharedDeclarationNode[0], _methods, _classMethods,
						_namespace, false, false,
						EmptyTraitUsageNode.factory.basicNew(),
						EmptyTraitUsageNode.factory.basicNew());
		SystemDefinitionNode systemDefinitionNode = ImageBootstrapper.systemMapping
				.systemDefinitionNode();
		ImageBootstrapper.systemMapping.updateTo_(systemDefinitionNode
				.withPackageNamed_classNode_(Symbol.value(name), classNode));
		return ImageBootstrapper.systemMapping.classMappingAtReference_(
				classNode.reference()).identityClass();
	}

	public static Object evaluate(String string) {

		Class stClass = new ClassBuilder("Evaluate" + evaluateCounter++)
				.method("foo ^" + string).build();

		try {
			Object fooObject = stClass.newInstance();
			Method method = fooObject.getClass().getMethod("foo");
			return method.invoke(fooObject);
		} catch (InstantiationException | IllegalAccessException
				| NoSuchMethodException | SecurityException
				| IllegalArgumentException | InvocationTargetException e) {
			throw new RuntimeException(e);
		}
	}

}

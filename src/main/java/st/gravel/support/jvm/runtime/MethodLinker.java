package st.gravel.support.jvm.runtime;

import java.lang.invoke.CallSite;
import java.lang.invoke.ConstantCallSite;
import java.lang.invoke.MethodHandle;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodHandles.Lookup;
import java.lang.invoke.MethodType;
import java.lang.reflect.Constructor;

import st.gravel.core.Symbol;
import st.gravel.support.compiler.ast.AbsoluteReference;
import st.gravel.support.compiler.ast.Reference;
import st.gravel.support.compiler.jvm.BlockSendArgument;
import st.gravel.support.jvm.ArrayExtensions;
import st.gravel.support.jvm.Block1;
import st.gravel.support.jvm.StringExtensions;


public class MethodLinker {

	public static CallSite bootstrap(Lookup lookup, String selector,
			MethodType type) throws Throwable {
		BaseCallSite site = SmalltalkCallSite.newInstance(lookup, type,
				selector);
		return site;
	}
	
	public static CallSite literalBlockSendBootstrap(final Lookup lookup, String selector,
			MethodType type, String ownerType, String astConstantNames) throws Throwable {
		
		final Class<?> ownerClass = ImageBootstrapper.systemMapping.compilerTools().classForName_(ownerType);
		BlockSendArgument[] astConstants = ArrayExtensions.collect_(StringExtensions.tokensBasedOn_(astConstantNames, ','), new Block1<BlockSendArgument, String>() {
			
			@Override
			public BlockSendArgument value_(String constantName)  {
				if (constantName.length()==0) return null;
				try {
					return (BlockSendArgument) lookup.findStaticGetter(ownerClass, constantName, Object.class).invoke();
				} catch (Throwable e) {
					throw new RuntimeException(e);
				}
			}
		});
		
		BaseCallSite site = LiteralBlockSendCallSite.newInstance(lookup, type, selector, astConstants);
		return site;
	}

	public static CallSite constructorBootstrap(Lookup lookup, String selector,
			MethodType type, String referenceString) throws Throwable {
		Reference reference = Reference.factory.value_(referenceString);
		Constructor constructor = ImageBootstrapper.systemMapping.classMappingAtReference_(reference).identityClass().getConstructor();
		MethodHandle constructorHandle = lookup.unreflectConstructor(constructor);
		return new ConstantCallSite(constructorHandle.asType(type));
	}

	public static CallSite superBootstrap(Lookup lookup, String selector,
			MethodType type, String lookupStart) throws Throwable {
		SuperCallSite site = SuperCallSite.newInstance(type, lookupStart,
				selector, lookup);
		return site;
	}

	public static CallSite fieldReadBootstrap(Lookup lookup, String selector,
			MethodType type) throws Throwable {
		FieldReadCallSite site = FieldReadCallSite.newInstance(lookup, type,
				selector);
		return site;
	}

	public static CallSite fieldWriteBootstrap(Lookup lookup, String selector,
			MethodType type) throws Throwable {
		FieldWriteCallSite site = FieldWriteCallSite.newInstance(lookup, type,
				selector);
		return site;
	}

	public static CallSite globalReadBootstrap(Lookup lookup, String selector,
			MethodType type, String namespaceString) throws Throwable {
		AbsoluteReference namespace = (AbsoluteReference) Reference.factory
				.value_(namespaceString);
		AbsoluteReference fullReference = namespace.$slash$(Symbol
				.value(selector));
		final AlmostFinalValue singletonHolder = ImageBootstrapper.systemMapping
				.resolveSingletonHolder_(fullReference);
		return new ConstantCallSite(singletonHolder.createGetter());
	}

	public static CallSite globalWriteBootstrap(Lookup lookup, String selector,
			MethodType type, String namespaceString) throws Throwable {
		AbsoluteReference namespace = (AbsoluteReference) Reference.factory
				.value_(namespaceString);
		AbsoluteReference fullReference = namespace.$slash$(Symbol
				.value(selector));
		final AlmostFinalValue singletonHolder = ImageBootstrapper.systemMapping
				.resolveSingletonHolder_(fullReference);
		final MethodHandle target = lookup.findVirtual(
				AlmostFinalValue.class,
				"setValue",
				MethodType.methodType(Object.class, Object.class)).bindTo(singletonHolder);
		return new ConstantCallSite(target);
	}

}
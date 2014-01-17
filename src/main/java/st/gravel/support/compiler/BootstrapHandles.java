package st.gravel.support.compiler;

import java.lang.invoke.CallSite;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;

import org.objectweb.asm.Handle;
import org.objectweb.asm.Opcodes;
import org.objectweb.asm.Type;

import st.gravel.support.jvm.runtime.MethodLinker;

public class BootstrapHandles {

	public static final Handle bootstrap = new Handle(Opcodes.H_INVOKESTATIC,
			Type.getInternalName(MethodLinker.class), "bootstrap", MethodType
					.methodType(CallSite.class, MethodHandles.Lookup.class,
							String.class, MethodType.class)
					.toMethodDescriptorString());
	public static final Handle literalBlockSendBootstrap = new Handle(Opcodes.H_INVOKESTATIC,
			Type.getInternalName(MethodLinker.class), "literalBlockSendBootstrap", MethodType
					.methodType(CallSite.class, MethodHandles.Lookup.class,
							String.class, MethodType.class, String.class, String.class, String.class)
					.toMethodDescriptorString());
	public static final Handle superBootstrap = new Handle(
			Opcodes.H_INVOKESTATIC, Type.getInternalName(MethodLinker.class),
			"superBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class,
					String.class).toMethodDescriptorString());
	public static final Handle blockBootstrap = new Handle(
			Opcodes.H_INVOKESTATIC, Type.getInternalName(MethodLinker.class),
			"blockBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class,
					String.class, String.class).toMethodDescriptorString());
	public static final Handle fieldReadBootstrap = new Handle(
			Opcodes.H_INVOKESTATIC, Type.getInternalName(MethodLinker.class),
			"fieldReadBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class)
					.toMethodDescriptorString());
	public static final Handle fieldWriteBootstrap = new Handle(
			Opcodes.H_INVOKESTATIC, Type.getInternalName(MethodLinker.class),
			"fieldWriteBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class)
					.toMethodDescriptorString());
	public static final Handle globalReadBootstrap = new Handle(
			Opcodes.H_INVOKESTATIC, Type.getInternalName(MethodLinker.class),
			"globalReadBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class,
					String.class).toMethodDescriptorString());
	public static final Handle globalWriteBootstrap = new Handle(
			Opcodes.H_INVOKESTATIC, Type.getInternalName(MethodLinker.class),
			"globalWriteBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class,
					String.class).toMethodDescriptorString());
	public static final Handle constructorBootstrap = new Handle(
			Opcodes.H_INVOKESTATIC, Type.getInternalName(MethodLinker.class),
			"constructorBootstrap", MethodType.methodType(CallSite.class,
					MethodHandles.Lookup.class, String.class, MethodType.class, String.class).toMethodDescriptorString());

}

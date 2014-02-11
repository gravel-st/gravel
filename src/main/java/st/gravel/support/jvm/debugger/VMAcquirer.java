package st.gravel.support.jvm.debugger;

import java.io.IOException;
import java.util.Map;

import com.sun.jdi.Bootstrap;
import com.sun.jdi.VirtualMachine;
import com.sun.jdi.VirtualMachineManager;
import com.sun.jdi.connect.AttachingConnector;
import com.sun.jdi.connect.IllegalConnectorArgumentsException;

// From: http://illegalargumentexception.blogspot.nl/2009/03/java-using-jpda-to-write-debugger.html

public class VMAcquirer {

	  /**
	   * Call this with the localhost port to connect to.
	   */
	  public VirtualMachine connect(int port)
	      throws IOException {
	    String strPort = Integer.toString(port);
	    AttachingConnector connector = getConnector();
	    try {
	      VirtualMachine vm = connect(connector, strPort);
	      return vm;
	    } catch (IllegalConnectorArgumentsException e) {
	      throw new IllegalStateException(e);
	    }
	  }

	  private AttachingConnector getConnector() {
	    VirtualMachineManager vmManager = Bootstrap
	        .virtualMachineManager();
	    for (AttachingConnector connector : vmManager
	        .attachingConnectors()) {
	      System.out.println(connector.name());
	      if ("com.sun.jdi.SocketAttach".equals(connector
	          .name())) {
	        return (AttachingConnector) connector;
	      }
	    }
	    throw new IllegalStateException();
	  }

	  private VirtualMachine connect(
	      AttachingConnector connector, String port)
	      throws IllegalConnectorArgumentsException,
	      IOException {
	    Map<String, AttachingConnector.Argument> args = connector
	        .defaultArguments();
	    AttachingConnector.Argument pidArgument = args.get("port");
	    if (pidArgument == null) {
	      throw new IllegalStateException();
	    }
	    pidArgument.setValue(port);

	    return connector.attach(args);
	  }

	}
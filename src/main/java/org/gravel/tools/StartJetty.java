package org.gravel.tools;

import java.io.File;
import java.net.URL;

import org.eclipse.jetty.server.Handler;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.handler.DefaultHandler;
import org.eclipse.jetty.server.handler.HandlerList;
import org.eclipse.jetty.server.handler.ResourceHandler;
import org.eclipse.jetty.servlet.ServletContextHandler;
import org.eclipse.jetty.servlet.ServletHolder;
import org.gravel.support.jvm.runtime.ImageBootstrapper;
import org.gravel.support.jvm.runtime.MethodTools;

public class StartJetty {

	public static void main(String[] args) throws Exception {
		File fn;
		int port = 8080;
		if (args.length == 0) {
			URL resource = ImageBootstrapper.class.getClassLoader().getResource("");
			fn = new File(resource.getFile());
		} else {
			fn = new File(args[0]);
			if (args.length != 1) {
				port = Integer.parseInt(args[1]);
			}
		}
		ImageBootstrapper.bootstrap(fn);
		Server server = new Server(port);

		ServletContextHandler servletContext = new ServletContextHandler(
				ServletContextHandler.SESSIONS);
		servletContext.setContextPath("/browser");
		
		ResourceHandler staticFilesHandler = new ResourceHandler();

	    staticFilesHandler.setResourceBase("src/main/html");

	    HandlerList handlers = new HandlerList();
	    handlers.setHandlers(new Handler[] {servletContext, staticFilesHandler, new DefaultHandler() });
	    
	    
		Object stServlet = getStServlet();

		servletContext.addServlet(new ServletHolder(new JettyToStHttpServletConverter(stServlet)), "/*");

		server.setHandler(handlers);
		server.start();
		server.join();
	}

	public static Object getStServlet() {
		Object appClass = ImageBootstrapper.systemMapping.singletonAtReferenceString_("org.gravel.ide.browser.BrowserApplication");
		Object stServlet = MethodTools.safePerform(appClass, "asServlet");
		return stServlet;
	}
}


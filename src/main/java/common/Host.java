package common;

import jakarta.servlet.http.HttpServletRequest;

import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.logging.Logger;

public class Host {
    private static final Logger logger = Logger.getLogger(Host.class.getName());
    public static String getServerIPAddress(HttpServletRequest request){
        try(final DatagramSocket socket = new DatagramSocket()){
            socket.connect(InetAddress.getByName("8.8.8.8"), 10002);
            return socket.getLocalAddress().getHostAddress() + ":" + request.getServerPort();
        } catch (UnknownHostException | SocketException e) {
            logger.info(e.getMessage());
            return null;
        }
    }
}
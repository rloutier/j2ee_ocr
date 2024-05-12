package forms;

import javax.servlet.http.HttpServletRequest;

public class ConnectionForm {
    private String connectionMessage;

    public void checkCredentials(HttpServletRequest request) {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
    
        connectionMessage = password.equals(login + "/123") ? "You are connected --" : "Credentials incorrect !";
    }

    public String getConnectionMessage() {
        return connectionMessage;
    }

    public void setConnectionMessage(String msg) {
        this.connectionMessage = msg;
    }
}

package controller.ForgotPassword;

import java.util.Random;

public class RandomPasswordGenerator {
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final Random RANDOM = new Random();

    public static String generateRandomString() {
        char[] randomChars = new char[7];
        for (int i = 0; i < 7; i++) {
            randomChars[i] = CHARACTERS.charAt(RANDOM.nextInt(CHARACTERS.length()));
        }
        return String.valueOf(randomChars);
    }
}

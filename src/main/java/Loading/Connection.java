package Loading;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.FirestoreOptions;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.cloud.FirestoreClient;
import java.io.FileInputStream;
import java.io.InputStream;

public class Connection {
	 public static Firestore getConnection()throws Exception
	    {   Firestore db;
	    InputStream is = Connection.class.getResourceAsStream("firebase-adminsdk-.json");

	    FirebaseOptions options = new FirebaseOptions.Builder()
	  .setCredentials(GoogleCredentials.fromStream(is))
	  .setDatabaseUrl("https://db-url.firebaseio.com")
	   
	  .build();
	try
	{
	    FirebaseApp obj=FirebaseApp.getInstance();
	}
	catch(Exception ex)
	{
	    FirebaseApp.initializeApp(options);
	}
	finally
	{
	 db = FirestoreClient.getFirestore();
	}
	 return db;
	    }
}

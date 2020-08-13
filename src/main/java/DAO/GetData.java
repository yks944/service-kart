package DAO;
import Loading.Connection;
import com.google.api.core.ApiFuture;
import com.google.cloud.Timestamp;
import com.google.cloud.firestore.CollectionReference;
import com.google.cloud.firestore.DocumentReference;
import com.google.cloud.firestore.DocumentSnapshot;
import com.google.cloud.firestore.Firestore;
import com.google.cloud.firestore.Query;
import com.google.cloud.firestore.QueryDocumentSnapshot;
import com.google.cloud.firestore.QuerySnapshot;
import com.google.cloud.firestore.WriteResult;


import DTO.ServicesDTO;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
public class GetData {
	 public static String getAddress(String uid)throws Exception
	    {  String address=null;
	        Firestore db=Connection.getConnection();
	       
	        DocumentReference docRef = db.collection("users").document(uid);
	// asynchronously retrieve the document
	ApiFuture<DocumentSnapshot> future = docRef.get();
	// ...
	// future.get() blocks on response
	DocumentSnapshot document = future.get();
	if (document.exists()) {
	 Map mp=document.getData();
	 address=(String)mp.get("address");
	 
	} else {
	  System.out.println("No such document!");
	}
	        return address;
	    }
	    public static boolean addEditDocument(String username,String address,String uid,String mobile)throws Exception
	    {   boolean result=true;
	    Firestore db=Connection.getConnection();
	            Map<String, Object> docData = new HashMap<String,Object>();
	docData.put("address", address);
	docData.put("name", username);
	docData.put("mobile",mobile);
	// Add a new document (asynchronously) in collection "cities" with id "LA"
	ApiFuture<WriteResult> future = db.collection("users").document(uid).set(docData);
	// ...
	// future.get() blocks on response

	System.out.println("Update time : " + future.get().getUpdateTime());
	    return result;
	    }
	    public static String getMobile(String uid)throws Exception
	    {
	        String mobile=null;
	        Firestore db=Connection.getConnection();
	       
	        DocumentReference docRef = db.collection("users").document(uid);
	// asynchronously retrieve the document
	ApiFuture<DocumentSnapshot> future = docRef.get();
	// ...
	// future.get() blocks on response
	DocumentSnapshot document = future.get();
	if (document.exists()) {
	 Map mp=document.getData();
	 mobile=(String)mp.get("mobile");
	 
	} else {
	  System.out.println("No such document!");
	}
	        return mobile;
	    }
	     
	 public static boolean addFeedback(String message, String uid)throws Exception
	    {   boolean result=true;
	    System.out.print("hello");
	    Firestore db=Connection.getConnection();
	            Map<String, Object> docData = new HashMap<String,Object>();
	docData.put("feeds", message);

	// Add a new document (asynchronously) in collection "cities" with id "LA"
	ApiFuture<WriteResult> future = db.collection("feedback").document(uid).set(docData);
	// ...
	// future.get() blocks on response

	System.out.println("Update time : " + future.get().getUpdateTime());
	    return result;
	    }
	 public static boolean setService(String uid,String servicename)throws Exception
	 {	boolean result=true;
		 Firestore db=Connection.getConnection();
		 Map<String, Object> docData = new HashMap<String,Object>();
		// Map<String, Object> docDataforadmin = new HashMap<String,Object>();
		 docData.put("service",servicename);
		 docData.put("checked",false);
		 docData.put("booking_time",Timestamp.now().toDate());
//		 docDataforadmin.put("service",servicename);
//		 docDataforadmin.put("checked",false);
//		 docDataforadmin.put("booking_time",Timestamp.now());
		 ApiFuture<WriteResult> future = db.collection("users").document(uid).collection("service").document(servicename).set(docData);
		// ApiFuture<WriteResult> future2 = db.collection("for_admin").document(uid).set(docDataforadmin);
		 System.out.println("Update time : of setservice" + future.get().getUpdateTime());
		 return result;
	 }
	 public static ArrayList<ServicesDTO> getCurrentService(String uid)throws Exception
	 {	ArrayList<ServicesDTO>al=new ArrayList<ServicesDTO>();
		 Firestore db=Connection.getConnection();
		 CollectionReference docref=db.collection("users").document(uid).collection("service");
		 Query query=docref.whereEqualTo("checked", false);
		 ApiFuture<QuerySnapshot> querySnapshot = query.get();
		 List<QueryDocumentSnapshot> documents = querySnapshot.get().getDocuments();
		 for(DocumentSnapshot document :documents)
		 {	ServicesDTO obj=new ServicesDTO();
			 Map <String,Object>mp=new HashMap<>();
			 mp.putAll(document.getData());
			 String service=(String)mp.get("service");
			 Timestamp bookingtime=(Timestamp)mp.get("booking_time");
			 obj.setServicename(service);
			 obj.setBookingtime(bookingtime);
			 al.add(obj);
		 }
		 return al;
	 }
	 public static ArrayList<ServicesDTO> getPreviousService(String uid)throws Exception
	 {	ArrayList<ServicesDTO>al=new ArrayList<ServicesDTO>();
	 	
		 Firestore db=Connection.getConnection();
		 CollectionReference docref=db.collection("users").document(uid).collection("service");
		 Query query=docref.whereEqualTo("checked", true);
		 ApiFuture<QuerySnapshot> querySnapshot = query.get();
		 List<QueryDocumentSnapshot> documents = querySnapshot.get().getDocuments();
		 for(DocumentSnapshot document :documents)
		 {	ServicesDTO obj=new ServicesDTO();
			 Map <String,Object>mp=new HashMap<>();
			 mp.putAll(document.getData());
			 String service=(String)mp.get("service");
			 Timestamp bookingtime=(Timestamp)mp.get("booking_time");
			 obj.setServicename(service);
			 obj.setBookingtime(bookingtime);
			 al.add(obj);
		 }
		 return al;
	 }
	 public static ServicesDTO getServiceDetails(String servicename,String uid)throws Exception
	 {	ServicesDTO obj=null;
		 Firestore db=Connection.getConnection();
		 CollectionReference docref=db.collection("users").document(uid).collection("service");
		 Query query=docref.whereEqualTo("service", servicename);
		 ApiFuture<QuerySnapshot> querySnapshot = query.get();
		 List<QueryDocumentSnapshot> documents = querySnapshot.get().getDocuments();
		 for(DocumentSnapshot document: documents)
		 {
			 obj=new ServicesDTO();
			 Map <String,Object>mp=new HashMap<>();
			 mp.putAll(document.getData());
			 String service=(String)mp.get("service");
			 Timestamp bookingtime=(Timestamp)mp.get("booking_time");
			 obj.setServicename(servicename);
			 obj.setBookingtime(bookingtime);
		 }
		 return obj;
	 }
//	 public static ArrayList<ServicesDTO>getAllUserServiceApplied()throws Exception
//	 {	ArrayList<ServicesDTO>al=new ArrayList<ServicesDTO>();
//		 Firestore db=Connection.getConnection();
//		 ApiFuture<QuerySnapshot> future = db.collection("users").get();
//		// future.get() blocks on response
//		List<QueryDocumentSnapshot> documents = future.get().getDocuments();
//		for (DocumentSnapshot document : documents) {
//			Map <String,Object>mplo=new HashMap<>();
//			 mplo.putAll(document.getData());
//			 String name=(String)mplo.get("name");
//			 String mobile=(String)mplo.get("mobile");
//			 CollectionReference docref=db.collection("users").document(document.getId()).collection("service");
//			 Query query=docref.whereEqualTo("checked", false);
//			 ApiFuture<QuerySnapshot> querySnapshot = query.get();
//			 List<QueryDocumentSnapshot> docs = querySnapshot.get().getDocuments();
//			 for(DocumentSnapshot doc: docs)
//			 {	
//				ServicesDTO obj=new ServicesDTO();
//				 Map <String,Object>mp=new HashMap<>();
//				 mp.putAll(doc.getData());
//				 String service=(String)mp.get("service");
//				 Timestamp bookingtime=(Timestamp)mp.get("booking_time");
//				 Boolean checked=(Boolean)mp.get("checked");
//				obj.setName(name);
//				obj.setMobile(mobile);
//				obj.setChecked(checked);
//				 obj.setServicename(service);
//				 obj.setBookingtime(bookingtime);
//				 al.add(obj);
//			 }
//		}
//		return al;
//	 }
}

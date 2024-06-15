import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shiv_super_app/core/error/failure.dart';
import 'package:shiv_super_app/core/error/server_exception.dart';
import 'package:shiv_super_app/features/auth/models/user_model.dart';
import 'package:shiv_super_app/features/jobs/model/company_model.dart';
import 'package:shiv_super_app/features/jobs/model/job_seeker_profile_model.dart';
import 'package:shiv_super_app/features/kyc/model/kyc_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(
    firestore: FirebaseFirestore.instance,
    auth: FirebaseAuth.instance,
  );
});

class AuthRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  AuthRepository({
    required this.firestore,
    required this.auth,
  });

  Stream<User?> get authStateChange => auth.authStateChanges();

  Future<Either<Failure, UserModel>> signiInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final result = await auth.signInWithCredential(credential);

      UserModel userModel;

      if (result.additionalUserInfo!.isNewUser) {
        userModel = UserModel(
          name: result.user!.displayName ?? "",
          email: result.user!.email ?? "",
          profilePic: result.user!.photoURL ?? "",
          uid: result.user!.uid,
          phoneNumber: result.user!.phoneNumber ?? "",
          isPartner: false,
          address: "",
          userPincode: "",
          jobDetailsUpdated: "",
          kycModel: KYCModel(
            name: "",
            fatherName: '',
            motherName: '',
            aadhaarNumber: '',
            panNumber: '',
            mobileNuber: '',
            email: '',
            ifscCode: '',
            areaPincode: '',
            age: 0,
            company: '',
            accountNumber: '',
          ),
          jobSeekerProfileModel: JobSeekerProfileModel(
            name: "",
            email: "",
            jobTitle: "",
            experience: 1,
            bio: "",
            resume: "",
          ),
          companyModel: CompanyModel(
            companyName: "",
            industry: "",
            companySize: 0,
            location: "",
            companyWebsiteURL: '',
            recruiterUid: "",
          ),
        );
        await firestore
            .collection("users")
            .doc(result.user!.uid)
            .set(userModel.toMap());
      } else {
        userModel = await getCurrentUserData();
      }

      return right(userModel);
    } catch (e) {
      return left(
        Failure(error: e.toString()),
      );
    }
  }

  Future<UserModel> getCurrentUserData() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    } else {
      throw ServerException("User Not found");
    }
    return user;
  }

  Future<UserModel?> getCurrentUserDataaaa() async {
    var userData =
        await firestore.collection('users').doc(auth.currentUser?.uid).get();

    UserModel? user;
    if (userData.data() != null) {
      user = UserModel.fromMap(userData.data()!);
    } else {
      throw ServerException("User Not found");
    }
    return user;
  }

  Future<void> signOut() async {
    return await auth.signOut();
  }
}

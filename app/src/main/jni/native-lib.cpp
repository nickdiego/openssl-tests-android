#include <jni.h>
#include <string>
#include <openssl/bio.h>

extern "C"
JNIEXPORT jstring JNICALL
Java_org_itriad_nativetests_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {

    BIO *b = (BIO*) malloc(sizeof(BIO));
    BIO_set_flags(b, 0);

    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}

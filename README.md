# Gradle Toolchain Error

This sample project shows an error in the gradle Java toolchain detection when run in a docker container.

This project is "as-is" from using the Gradle 8.12 `gradle init` command with the exception of adding a sample `Dockerfile` that can be used to reproduce the issue.

## Steps to reproduce

1. Compile the project directly using `./gradlew build` : The compilation should succeed.
1. Compile the project using Docker `docker build -t gradle-toolchain-error:latest .` : The compilation will fail.

Error message returned during the docker build is:

```
27.56 FAILURE: Build failed with an exception.
27.56
27.56 * What went wrong:
27.56 Could not determine the dependencies of task ':lib:compileJava'.
27.56 > Could not resolve all dependencies for configuration ':lib:compileClasspath'.
27.56    > Failed to calculate the value of task ':lib:compileJava' property 'javaCompiler'.
27.56       > Cannot find a Java installation on your machine matching this tasks requirements: {languageVersion=8, vendor=any vendor, implementation=vendor-specific} for LINUX on x86_64.
27.56          > No matching toolchain could be found in the locally installed toolchains or the configured toolchain download repositories. Some toolchain resolvers had provisioning failures: foojay (Unable to download toolchain matching the requirements ({languageVersion=8, vendor=any vendor, implementation=vendor-specific}) from 'https://api.foojay.io/disco/v3.0/ids/ac4c40cdd772fae20f1758b6fd9ac1d6/redirect', due to: Unpacked JDK archive does not contain a Java home: /root/.gradle/.tmp/jdks/OpenJDK8U-jdk_x64_linux_hotspot_8u442b062166212928083939638.tmp).
27.56
27.56 * Try:
27.56 > Learn more about toolchain auto-detection at https://docs.gradle.org/8.12/userguide/toolchains.html#sec:auto_detection.
27.56 > Learn more about toolchain repositories at https://docs.gradle.org/8.12/userguide/toolchains.html#sub:download_repositories.
27.56 > Run with --stacktrace option to get the stack trace.
27.56 > Run with --info or --debug option to get more log output.
27.56 > Run with --scan to get full insights.
27.56 > Get more help at https://help.gradle.org.
```
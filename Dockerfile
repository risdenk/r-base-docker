FROM openjdk:8-jdk-alpine

ENV R_VERSION 3.3.1

RUN echo 'options(repos = c(CRAN = "http://cran.rstudio.com/"))' >> ~/.Rprofile
RUN apk --no-cache add build-base gfortran readline-dev perl zlib-dev bzip2-dev xz-dev pcre-dev libcurl curl-dev libintl gettext-asprintf gettext-dev
RUN wget -qO- http://cran.r-project.org/src/base/R-3/R-${R_VERSION}.tar.gz | tar zvx -C / && cd R-${R_VERSION} && ./configure --with-x=no --enable-R-shlib=yes && make && make install && rm -rf /R-${R_VERSION}

RUN R CMD javareconf


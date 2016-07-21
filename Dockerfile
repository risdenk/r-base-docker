FROM java:8-jdk-alpine

RUN echo 'options(repos = c(CRAN = "http://cran.rstudio.com/"))' >> ~/.Rprofile
RUN apk --no-cache add build-base gfortran readline-dev perl zlib-dev
RUN wget -qO- http://cran.r-project.org/src/base/R-3/R-3.3.1.tar.gz | tar zvx -C / && cd R-3.3.1 && ./configure --with-x=no && make && make install && rm -rf /R-3.3.1

RUN R CMD javareconf

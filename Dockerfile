FROM ubuntu 

RUN apt update 
RUN apt install -y apache2 
RUN apt install -y apache2-utils 
RUN apt install -y less 
RUN apt clean 

RUN a2enmod rewrite

# Install: mod_dispatcher
COPY ./install/linux_arch64/dispatcher-apache2.4-4.3.5.so /usr/lib/apache2/modules/mod_dispatcher.so
RUN echo "LoadModule dispatcher_module /usr/lib/apache2/modules/mod_dispatcher.so" > /etc/apache2/mods-available/mod_dispatcher.load
RUN ln -s /etc/apache2/mods-available/mod_dispatcher.load /etc/apache2/mods-enabled/mod_dispatcher.load
RUN ln -s /etc/apache2/conf/dispatcher.conf /etc/apache2/conf-enabled/dispatcher.conf

RUN echo "alias l='ls -l'" >> ~/.bashrc
RUN echo "alias tf='tail -f'" >> ~/.bashrc
RUN echo "alias ll='ls -alF'" >> ~/.bashrc

#RUN ln -sf /proc/self/fd/1 /var/log/apache2/access.log && \
#    ln -sf /proc/self/fd/1 /var/log/apache2/error.log

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]



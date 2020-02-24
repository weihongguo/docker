FROM scratch

EXPOSE port

ADD ./demo /

CMD ["/demo"]

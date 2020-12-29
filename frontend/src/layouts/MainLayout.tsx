import React, { ReactElement } from "react";
import Header from "../components/Header";
import { Container } from "reactstrap";

const MainLayout = ({ children }: { children?: ReactElement }) => {
  return (
    <>
      <Header />
      <Container className="py-3">{children}</Container>
    </>
  );
};

export default MainLayout;

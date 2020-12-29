import React from "react";
import { PuffLoader } from "react-spinners";
import "./style.css";

const Loading = ({ show }: { show: boolean }) =>
  show ? (
    <div className="text-center overlay">
      <div className="">
        <PuffLoader color="#e50404" />
      </div>
    </div>
  ) : (
      <span></span>
    );

export default Loading;

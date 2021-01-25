import React from "react";
import { RingLoader } from "react-spinners";
import "./style.scss";

const Loading = ({ show }: { show: boolean }) =>
  show ? (
    <div className="text-center overlay">
      <div className="">
        <RingLoader />
      </div>
    </div>
  ) : (
    <span></span>
  );

export default Loading;

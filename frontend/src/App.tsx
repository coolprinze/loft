import React from "react";
import { BrowserRouter, Route, Switch } from "react-router-dom";
import { toast, ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import "./App.css";
import Antigua from "./pages/Antigua";
// import Business from "./pages/Business";
// import Family from "./pages/Family";
// import General from "./pages/General";
// import Study from "./pages/Study";

function App() {
  return (
    <>
      <ToastContainer
        autoClose={8000}
        draggable
        position={toast.POSITION.BOTTOM_LEFT}
      />
      <BrowserRouter>
        <Switch>
          <Route
            path={`${process.env.PUBLIC_URL}/antigua`}
            component={Antigua}
          />

          {/* <Route
            path={`${process.env.PUBLIC_URL}/business-immigration`}
            component={Business}
          />
          <Route
            path={`${process.env.PUBLIC_URL}/family-sponsorship`}
            component={Family}
          />
          <Route
            path={`${process.env.PUBLIC_URL}/study-visa`}
            component={Study}
          />
          <Route path={`/`} component={General} /> */}
        </Switch>
      </BrowserRouter>
    </>
  );
}

export default App;

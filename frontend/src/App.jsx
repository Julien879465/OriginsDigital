import React from "react";
import { ToastContainer } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";
import { useLocation, Routes, Route } from "react-router-dom";
import { useSignInContext } from "./contexts/SignInContext";
import { FormContextProvider } from "./contexts/FormContext";

import Home from "./pages/Home";
import Search from "./pages/Search";
import Favorites from "./pages/Favorites";
import SignIn from "./pages/SignIn";
import SignUp from "./pages/SignUp";
import SignUpConfirmation from "./pages/SignUpConfirmation";
import Video from "./pages/Video";
import Footer from "./components/Footer";
import Navbar from "./components/Navbar";
import Header from "./components/Header";
import Profile from "./pages/Profile";
import LegalSpace from "./pages/LegalSpace";
import TermsOfUse from "./pages/TermsOfUse";
import TermsOfSale from "./pages/TermsOfSale";
import Account from "./pages/Account";
import Help from "./pages/Help";
import DeskNavbar from "./components/DeskNavbar";
import Subscribe from "./pages/Subscribe";
import SubscribesTerms from "./pages/SubscribesTerms";
import Payment from "./pages/Payment";
import PaymentConfirmation from "./pages/PaymentConfirmation";
import Admin from "./pages/Admin";
import ProtectedRoute from "./components/ProtectedRoute";
import PasswordForgot from "./pages/PasswordForgot";
import AddVideo from "./pages/AddVideo";
import ManageVideo from "./pages/ManageVideo";
import ManageCategory from "./pages/ManageCategory";
import AddPages from "./pages/AddPages";

function App() {
  const { user } = useSignInContext();
  const location = useLocation();
  return (
    <FormContextProvider>
      <Header />
      <DeskNavbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/search" element={<Search />} />
        <Route path="/favorites" element={<Favorites />} />
        <Route path="/sign-in" element={<SignIn />} />
        <Route path="/sign-up" element={<SignUp />} />
        <Route path="/sign-up-confirmation" element={<SignUpConfirmation />} />
        <Route path="/videos/:id" element={<Video />} />
        <Route path="/videos" element={<Video />} />
        <Route
          element={
            <ProtectedRoute
              isAllowed={user && user.roles && user.roles.includes("user")}
              redirectPath="/profile"
            />
          }
        />
        <Route path="/profile" element={<Profile />} />
        <Route path="/account" element={<Account />} />
        <Route path="/legal" element={<LegalSpace />} />
        <Route path="/gtcu" element={<TermsOfUse />} />
        <Route path="/gtcs" element={<TermsOfSale />} />
        <Route path="/help" element={<Help />} />
        <Route path="/subscribes" element={<Subscribe />} />
        <Route path="/subscribes/terms" element={<SubscribesTerms />} />
        <Route path="/payments" element={<Payment />} />
        <Route
          path="/payments/confirmation"
          element={<PaymentConfirmation />}
        />
        <Route path="/password" element={<PasswordForgot />} />
        <Route
          element={
            <ProtectedRoute
              isAllowed={user && user.roles && user.roles.includes("admin")}
              redirectPath="/admin"
              element={<Admin />}
            />
          }
        />
        <Route path="/admin" element={<Admin />} />
        <Route
          element={
            <ProtectedRoute
              isAllowed={user && user.roles && user.roles.includes("admin")}
              redirectPath="/add-video"
              element={<AddVideo />}
            />
          }
        />
        <Route path="/add-video" element={<AddVideo />} />
        <Route path="/manage-categories" element={<ManageCategory />} />
        <Route path="/manage-video" element={<ManageVideo />} />
        <Route path="/add-pages" element={<AddPages />} />
      </Routes>
      <ToastContainer theme="dark" autoClose={2000} />
      <Navbar />
      {location.pathname !== "/sign-up" && location.pathname !== "/sign-in" && (
        <Footer />
      )}
    </FormContextProvider>
  );
}

export default App;

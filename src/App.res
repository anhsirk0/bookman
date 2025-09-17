@react.component
let make = () => {
  <div className="main flex-col p-8 relative">
    <Toast.Toaster />
    <p className="text-7xl"> {"Bookmarks"->React.string} </p>
  </div>
}
